Extension { #name : #BlockClosure }

{ #category : #'*TypedSlot-Block' }
BlockClosure >> asConstraint [
	^ PredicateConstraint new
		predicate: self;
		yourself
]

{ #category : #'*TypedSlot-Block' }
BlockClosure >> checkConstraint: anObject [
	"In case of error during block evaluation, object is not valid for the slot."
	([ self value: anObject ] on: Error do: [ false ]) 
		ifFalse: [ (ConstraintViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
