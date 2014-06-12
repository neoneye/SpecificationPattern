/*

!!!!!!!!!!! Warning: this is experimental code !!!!!!!!!!!!!

I have tried the &|! operator overloading in swift, but it's somewhat buggy.
So don't rely on the operator overloading just yet!

*/

/*
and operator - shorthand for .and()

USAGE:
let spec = onlyDigits & between2And4Letters & modulus13Checksum
*/
@infix func & (left: Specification, right: Specification) -> Specification {
	return left.and(right)
}

/*
or operator - shorthand for .or()

USAGE:
let spec = connectionTypeWifi | connectionType4G | hasOfflineData
*/
@infix func | (left: Specification, right: Specification) -> Specification {
	return left.or(right)
}

/*
negate operator - shorthand for .not()

USAGE:
let spec = ! filesystemIsFull
*/
@prefix func ! (specification: Specification) -> Specification {
	return specification.not()
}
