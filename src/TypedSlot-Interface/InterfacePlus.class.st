"
I am an interface representing the selector #+.

"
Class {
	#name : #InterfacePlus,
	#superclass : #Interface,
	#category : #'TypedSlot-Interface'
}

{ #category : #initialization }
InterfacePlus >> initialize [
	super initialize.
	self addSelector: #+
]
