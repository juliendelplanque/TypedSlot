"
I represent an Interface of selectors, as a Java interface.
I can either be used anonymously by instanciating myself,
or subclassed to be given a name.

For named interfaces, as a first version, I fill my own #selectors variable on instance creation in the #initialize method. See InterfacePlus for an example.

	my #selectors instance variable contains the selectors (using symbols) that I represent
	my #extendedInterfaces variables contains a reference to other interfaces I am extending (in the java sense). I can only extend interfaces with whom I have no selector in common. (an exemple of this would be nice)
	
"
Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'selectors',
		'extendedInterfaces'
	],
	#category : #'TypedSlot-Interface'
}

{ #category : #converting }
Interface class >> asInterfaceConstraint [
	^ NamedInterfaceType new interface: self new ; yourself
]

{ #category : #accessing }
Interface class >> selectors: aCollectionOfSymbols [
	^ self new
		selectors: aCollectionOfSymbols;
		yourself
]

{ #category : #comparing }
Interface >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ selectors = anObject selectors
		and: [ extendedInterfaces = anObject extendedInterfaces ]
]

{ #category : #adding }
Interface >> addSelector: aSymbol [
	selectors add: aSymbol
]

{ #category : #accessing }
Interface >> extendedInterfaces [
	^ extendedInterfaces
]

{ #category : #accessing }
Interface >> extendedInterfaces: aCollectionOfInterfaces [
	| allSelectors |
	allSelectors := selectors , (aCollectionOfInterfaces flatCollect: #selectors).
	allSelectors size = allSelectors asSet size
		ifFalse: [ InterfacesConflict signal ].
	
	extendedInterfaces := aCollectionOfInterfaces
]

{ #category : #comparing }
Interface >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ selectors hash bitXor: extendedInterfaces hash
]

{ #category : #initialization }
Interface >> initialize [
	super initialize.
	self selectors: Set new.
	self extendedInterfaces: #()
]

{ #category : #accessing }
Interface >> name [
	^ self class = Interface ifTrue: nil ifFalse: [ self class name ]
]

{ #category : #printing }
Interface >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #accessing }
Interface >> selectors [
	^ selectors , (self extendedInterfaces flatCollect: #selectors)
]

{ #category : #accessing }
Interface >> selectors: anObject [
	selectors := anObject
]

{ #category : #printing }
Interface >> storeOn: aStream [
	self selectors asArray storeOn: aStream
]
