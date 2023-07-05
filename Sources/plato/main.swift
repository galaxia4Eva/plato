// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import julia

enum PlatoError: Error {
    case juliaError, unknownError
    case cannotFindScript(_: String)
}

func main() throws -> Int32 {
    setenv("JULIA_PROJECT", FileManager.default.currentDirectoryPath, 0)

    jl_init()

    defer {
        print()
        print("cleaning julia")
        jl_atexit_hook(0)
    }

    let scriptFile = "test.jl"

    guard let script = try? String(contentsOfFile: scriptFile, encoding: String.Encoding.utf8) else {
        print("canot load script")
        throw PlatoError.cannotFindScript(scriptFile)
    }

    print("evaluating:")
    print("```julia")
    print(script)
    print("```")

    _ = jl_eval_string(script)

    guard jl_exception_occurred() == nil else {

        guard let jlFnShowError = jl_get_function(jl_base_module, "showerror") else {
            return -1
        }
        guard let jlObjError = jl_stderr_obj() else {
            return -2
        }

        jl_call2(jlFnShowError, jlObjError, jl_exception_occurred())
        throw PlatoError.juliaError
    }

    return 0
}

exit(try main())
