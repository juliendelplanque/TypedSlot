"
I represent a anonymous interface for a typed slot.

I am declared anonymously for a slot using symbols or arrays of byteSymbols.

	Try me! 
	creation: #anIV understands: #+.
	or: #anIV understands: {#+}.
	
"
Class {
	#name : #AnonymousInterfaceType,
	#superclass : #AbstractInterfaceType,
	#category : #TypedSlotHogo
}

{ #category : #accessing }
AnonymousInterfaceType class >> selectors: aCollectionOfSymbols [
	^ self new
		interface: (Interface selectors: aCollectionOfSymbols);
		yourself
]

{ #category : #printing }
AnonymousInterfaceType >> definitionStringOn: aStream [
	aStream print: interface selectors asArray
]

{ #category : #testing }
AnonymousInterfaceType >> isAnonymous [
	^ true
]

{ #category : #printing }
AnonymousInterfaceType >> typeViolationWith: anObject [
	(TypeViolation expectedType: self interface objectAttemptedToBeWritten: anObject) signal
]
