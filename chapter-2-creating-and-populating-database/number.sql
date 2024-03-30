/**
 * Numberic Data
*/
Type: tinyint, signed range: -128 to 127, Unsigned range: 0 to 255
Type: smallint, signed range: −32,768 to 32,767, Unsigned range: 0 to 65,535
Type: mediumint, signed range: −8,388,608 to 8,388,607, Unsigned range: 0 to 16,777,215
Type: int, signed range: −2,147,483,648 to 2,147,483,647, Unsigned range: 0 to 4,294,967,295
Type: bigint, signed range:−2^63 to 2^63 - 1, Unsigned range: 0 to 2^64 - 1

/**
 * Floating-point types
*/
Type: float( p , s ), −3.402823466E+38 to −1.175494351E-38 and 1.175494351E-38 to 3.402823466E+38
Type: double( p , s ), −1.7976931348623157E+308 to −2.2250738585072014E-308 and 2.2250738585072014E-308 to 1.7976931348623157E+308

/**
 * Temporal types
*/
Type: date, default format: YYYY-MM-DD, allowable values: 1000-01-01 to 9999-12-31 to 9999-12-31 23:59:59.999999
Type: timestamp, default format: YYYY-MM-DD HH:MI:SS, allowable values: 1970-01-01 00:00:00.000000 to 2038-01-18 22:14:07.999999
Type: year, default format: YYYY, allowable values: 1901 to 2155
Type: time, default format: HHH:MI:SS, allowable values: −838:59:59.000000 to 838:59:59.000000

/**
 * Date format components
*/
Component: YYYY, Defination: Year, including century, range: 1000 to 9999
Component: MM, Defination : Month, range           : 01 (January) to 12 (December)
Component: DD, Defination : Day, range             : 01 to 31
Component: HH, Defination : Hour, range            : 00 to 23
Component: HHH, Defination: Hours (elapsed) , range: −838 to 838
Component: MI, Defination : Minute , range         : 00 to 59
Component: SS, Defination : Second , range         : 00 to 59