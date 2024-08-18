# List of sizes of data types
## Numbers
### Integers
| Go        | Rust/Zig | Java      | Scala     | Kotlin    | C#       | C                      |
| --------- | -------- | --------- | --------- | --------- | -------- | ---------------------- |
| `bool`    | `bool`   | `boolean` | `Boolean` | `Boolean` | `bool`   | `bool`                 |
| `int8`    | `i8`     | `byte`    | `Byte`    | `Byte`    | `sbyte`  | `signed char`          |
| `int16`   | `i16`    | `short`   | `Short`   | `Short`   | `short`  | (`signed`) `short`     |
| `int32`   | `i32`    | `int`     | `Int`     | `Int`     | `int`    | (`signed`) `long`      |
| `int64`   | `i64`    | `long`    | `Long`    | `Long`    | `long`   | (`signed`) `long long` |
| -         | `i128`   | -         | -         | -         | -        | -                      |
| `int`     | `isize`  | -         | -         | -         | `nint`   | -                      |
| `uint8`   | `u8`     | -         | -         | `UByte`   | `byte`   | `unsigned char`        |
| `uint16`  | `u16`    | `char`    | `Char`    | `UShort`  | `ushort` | `unsighed short`       |
| `uint32`  | `u32`    | -         | -         | `UInt`    | `uint`   | `unsigned long`        |
| `uint64`  | `u64`    | -         | -         | `ULong`   | `ulong`  | `unsigned long long`   |
| -         | `u128`   | -         | -         | -         | -        | -                      |
| `uint`    | `usize`  | -         | -         | -         | `nuint`  | -                      |
| `uintptr` | -        | -         | -         | -         | -        | -                      |

- Aliases for certain integer types:
  - `u8`: `byte` (Go)
  - `i32`: `rune` (Go)
  - `bool`: `_Bool` (C)
- GNU `libc` offers alternative types for intergers. [Read more](https://www.gnu.org/software/libc/manual/html_node/Integers.html)

### Floats and more
| Go           | Rust/Zig | Java      | Scala/Kotlin | C#       | C                 |
| ------------ | -------- | --------- | ------------ | -------- | ----------------- |
| -            | `f16`    | -         | -            | -        | -                 |
| `float32`    | `f32`    | `float`   | `Float`      | `float`  | `float`           |
| `float64`    | `f64`    | `double`  | `Double`     | `double` | `double`          |
| -            | `f128`   | -         | -            | -        | `__float128`      |
| `complex64`  | -        | -         | -            | -        | `float _Complex`  |
| `complex128` | -        | -         | -            | -        | `double _Complex` |

- The C# [`decimal`](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types) type occupies 128 bits, but is different from `f128`.
- [`long double`](https://en.wikipedia.org/wiki/Long_double) in C varies in compiler implementations.
- Some C implementations may use `_Float128` for `f128`.