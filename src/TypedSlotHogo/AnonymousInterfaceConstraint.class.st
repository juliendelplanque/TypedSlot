"
I represent a anonymous interface for a typed slot.

I am declared anonymously for a slot using symbols or arrays of byteSymbols.

	Try me! 
	creation: #anIV understands: #+.
	or: #anIV understands: {#+}.
	
"
Class {
	#name : #AnonymousInterfaceConstraint,
	#superclass : #AbstractInterfactConstraint,
	#category : #TypedSlotHogo
}

{ #category : #accessing }
AnonymousInterfaceConstraint class >> selectors: aCollectionOfSymbols [
	^ self new
		interface: (Interface selectors: aCollectionOfSymbols);
		yourself
]

{ #category : #printing }
AnonymousInterfaceConstraint >> definitionStringOn: aStream [
	aStream print: interface selectors asArray
]

{ #category : #testing }
AnonymousInterfaceConstraint >> isAnonymous [
	^ true
]

{ #category : #printing }
AnonymousInterfaceConstraint >> wasViolatedBy: anObject [
	(ConstraintViolation expectedType: self interface objectAttemptedToBeWritten: anObject) signal
]
