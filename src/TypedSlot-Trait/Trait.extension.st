Extension { #name : #Trait }

{ #category : #'*TypedSlot-Trait' }
Trait >> checkObjectType: anObject [
	(self users includes: anObject class)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
