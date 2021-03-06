Extension { #name : #Trait }

{ #category : #'*TypedSlot-Trait' }
Trait >> checkObjectType: anObject [
	(self users includesAny: anObject class withAllSuperclasses)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
