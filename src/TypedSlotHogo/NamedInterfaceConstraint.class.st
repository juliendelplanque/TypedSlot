"
I represent a named interface for a typed slot.

I am declared using a reference to an existing interface for a slot.
	Try me! 
	creation: #anIV understands: InterfacePlus.
"
Class {
	#name : #NamedInterfaceConstraint,
	#superclass : #AbstractInterfactConstraint,
	#instVars : [
		'interfaceSource',
		'interfaceSelector'
	],
	#category : #TypedSlotHogo
}

{ #category : #'instance creation' }
NamedInterfaceConstraint class >> from: aClass [
	^ self new interface: (Interface selectors: aClass selectors)
]

{ #category : #printing }
NamedInterfaceConstraint >> definitionStringOn: aStream [
	aStream << interface name
]
