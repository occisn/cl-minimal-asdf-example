# cl-minimal-examples

Three minimal Common Lisp projects, from a single file to an ASDF system with a test suite.

# Overview

Each directory is a complete, self-contained example. They implement the same
handful of functions, so that the only thing that varies between them is the
project structure:

| | Example | What it adds |
|---|---|---|
| A | `A-one-file-program/` | package, code and entry point in one file; no ASDF |
| B | `B-asdf-project-without-tests/` | an ASDF system, `src/`, one file per concern |
| C | `C-asdf-project-with-tests/` | a second ASDF system holding the tests |

They have no dependencies, apart from [Parachute](https://shinmera.github.io/parachute/)
for the test suite of example C, and run on any conforming implementation.

The conventions they follow are those of the
[Common Lisp style guide](https://lisp-lang.org/style-guide/): `;;;;` file
headers, `*earmuffs*` on special variables, `+plus-signs+` on constants, `p` /
`-p` on predicates, docstrings everywhere, `:import-from` rather than a broad
`:use`, and system definition files that contain nothing but a system
definition.

# Usage

## A. One-file program

No registration and no ASDF. Compile the file, from SLIME with `C-c C-k`, or
at the REPL:

```lisp
(load (compile-file "A-one-file-program/one-file.lisp"))
(my-app:main)
```

## B and C. ASDF projects

### Register the project with ASDF

In the REPL:

```lisp
(push #P"c:/.../cl-minimal-examples/C-asdf-project-with-tests/" asdf:*central-registry*)
```

For a permanent registration, add that line to your `.sbclrc`.

Verification — these should return a system object rather than signal an error:

```lisp
(asdf:find-system :cl-my-project2)
(asdf:find-system :cl-my-project2-tests)
```

### Load the system

Any of:

```lisp
(asdf:load-system :cl-my-project2)
(ql:quickload :cl-my-project2)
```

or `,load-system [cl-my-project2]` from the SLIME REPL.

At the start of a work session it is often easier to load the test system,
which pulls in the main system as a dependency:

```lisp
(asdf:load-system :cl-my-project2-tests)
```

### Call a function

```lisp
(cl-my-project2:main)
(cl-my-project2:triple 4)               ; => 12
```

`double` is deliberately *not* exported, so reaching it takes two colons:

```lisp
(cl-my-project2::double 2)              ; => 4
```

This is what the double colon means: the symbol exists in the package, but the
package does not offer it as part of its interface. Example C shows the other
way to reach such a symbol — `tests/package.lisp` names it in an
`:import-from` clause, which works on internal symbols too.

### Run the tests

```lisp
(asdf:test-system :cl-my-project2)
(parachute:test :cl-my-project2-tests)
```

or `,test-system [cl-my-project2]` from the SLIME REPL. For a single test:

```lisp
(parachute:test 'cl-my-project2-tests::test-triple)
```

# License

Copyright (c) 2025 Nicolas Occis

Licensed under the MIT License.
