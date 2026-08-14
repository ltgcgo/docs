# List of sizes of data types
## Numbers
### Integers
| Go        | Rust/Zig | Odin      | C#       | Java      | Scala     | Kotlin    | C                      |
| --------- | -------- | --------- | -------- | --------- | --------- | --------- | ---------------------- |
| `bool`    | `bool`   | `bool`    | `bool`   | `boolean` | `Boolean` | `Boolean` | `bool`                 |
| `int8`    | `i8`     | `i8`      | `sbyte`  | `byte`    | `Byte`    | `Byte`    | `signed char`          |
| `int16`   | `i16`    | `i16`     | `short`  | `short`   | `Short`   | `Short`   | (`signed`) `short`     |
| `int32`   | `i32`    | `i32`     | `int`    | `int`     | `Int`     | `Int`     | (`signed`) `long`      |
| `int64`   | `i64`    | `i64`     | `long`   | `long`    | `Long`    | `Long`    | (`signed`) `long long` |
| -         | `i128`   | `i128`    | -        | -         | -         | -         | -                      |
| `int`     | `isize`  | `int`     | `nint`   | -         | -         | -         | -                      |
| `uint8`   | `u8`     | `u8`      | `byte`   | -         | -         | `UByte`   | `unsigned char`        |
| `uint16`  | `u16`    | `u16`     | `ushort` | `char`    | `Char`    | `UShort`  | `unsighed short`       |
| `uint32`  | `u32`    | `u32`     | `uint`   | -         | -         | `UInt`    | `unsigned long`        |
| `uint64`  | `u64`    | `u64`     | `ulong`  | -         | -         | `ULong`   | `unsigned long long`   |
| -         | `u128`   | `u128`    | -        | -         | -         | -         | -                      |
| `uint`    | `usize`  | `uint`    | `nuint`  | -         | -         | -         | -                      |
| `uintptr` | -        | `uintptr` | -        | -         | -         | -         | -                      |

- Aliases for certain integer types:
  - `u8`: `byte` (Go)
  - `i32`: `rune` (Go, Odin)
  - `bool`: `_Bool` (C)
- Odin has [endian-specific types](https://odin-lang.org/docs/overview/#basic-types).
- GNU `libc` offers alternative types for intergers. [Read more](https://www.gnu.org/software/libc/manual/html_node/Integers.html)

### Floats and more
| Go           | Rust/Zig | Odin            | Java      | Scala/Kotlin | C#       | C                 |
| ------------ | -------- | --------------- | --------- | ------------ | -------- | ----------------- |
| -            | `f16`    | `f16`           | -         | -            | -        | -                 |
| `float32`    | `f32`    | `f32`           | `float`   | `Float`      | `float`  | `float`           |
| `float64`    | `f64`    | `f64`           | `double`  | `Double`     | `double` | `double`          |
| -            | `f128`   |                 | -         | -            | -        | `__float128`      |
| -            | -        | `complex32`     | -         | -            | -        | -                 |
| `complex64`  | -        | `complex64`     | -         | -            | -        | `float _Complex`  |
| `complex128` | -        | `complex128`    | -         | -            | -        | `double _Complex` |
| -            | -        | `quaternion64`  | -         | -            | -        |                   |
| -            | -        | `quaternion128` | -         | -            | -        |                   |
| -            | -        | `quaternion256` | -         | -            | -        |                   |

- Odin has [endian-specific types](https://odin-lang.org/docs/overview/#basic-types).
- The C# [`decimal`](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types) type occupies 128 bits, but is different from `f128`.
- [`long double`](https://en.wikipedia.org/wiki/Long_double) in C varies in compiler implementations.
- Some C implementations may use `_Float128` for `f128`.