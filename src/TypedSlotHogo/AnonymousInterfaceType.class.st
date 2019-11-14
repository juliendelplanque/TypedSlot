"
An interface:
- declares only method selectors
- cannot be instantiated.
- can be used to type a TypedSlot
- can extend several other interfaces.
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
