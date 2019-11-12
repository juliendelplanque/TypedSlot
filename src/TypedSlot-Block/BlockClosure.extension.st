Extension { #name : #BlockClosure }

{ #category : #'*TypedSlot-Block' }
BlockClosure >> checkObjectType: anObject [
	"In case of error during block evaluation, object is not valid for the slot."
	([ self value: anObject ] on: Error do: [ false ]) 
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]

{ #category : #'*TypedSlot-Block' }
BlockClosure >> createType [
	^ ValidatorType new
		predicate: self;
		yourself
]

{ #category : #'*TypedSlot-Block' }
BlockClosure >> hasFullControlOnDefinitionString [
	^ false
]
