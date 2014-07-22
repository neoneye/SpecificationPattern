/*
And operator - shorthand for .and()

USAGE:
let spec = onlyDigits & between2And4Letters & modulus13Checksum
*/
@infix func & (left: Specification, right: Specification) -> Specification {
	return left.and(right)
}

/*
Or operator - shorthand for .or()

USAGE:
let spec = connectionTypeWifi | connectionType4G | hasOfflineData
*/
@infix func | (left: Specification, right: Specification) -> Specification {
	return left.or(right)
}

/*
Negate operator - shorthand for .not()

USAGE:
let spec = ! filesystemIsFull
*/
@prefix func ! (specification: Specification) -> Specification {
	return specification.not()
}


/*
Equivalence operators - shorthand for .isSatisfiedBy()

USAGE:
spec == "123"
spec != "123"
*/
@infix func == (left: Specification, right: Any?) -> Bool {
	return left.isSatisfiedBy(right)
}
@infix func != (left: Specification, right: Any?) -> Bool {
	return !left.isSatisfiedBy(right)
}
