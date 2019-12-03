Extension { #name : #Trait }

{ #category : #'*TypedSlot-Trait' }
Trait >> asConstraint [
	^ TraitConstraint new
		trait: self ;
		yourself.
]

{ #category : #'*TypedSlot-Trait' }
Trait >> checkConstraint: anObject [
	(self users includesAny: anObject class withAllSuperclasses)
		ifFalse: [ (ConstraintViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]
