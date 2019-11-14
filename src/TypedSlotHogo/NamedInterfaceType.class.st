"
I represent a named interface for a typed slot.

I am declared using a reference to an existing interface for a slot.
	Try me! 
	creation: #anIV understands: InterfacePlus.
"
Class {
	#name : #NamedInterfaceType,
	#superclass : #AbstractInterfaceType,
	#instVars : [
		'interfaceSource',
		'interfaceSelector'
	],
	#category : #TypedSlotHogo
}

{ #category : #'instance creation' }
NamedInterfaceType class >> from: aClass [
	^ self new interface: (Interface selectors: aClass selectors)
]

{ #category : #printing }
NamedInterfaceType >> definitionStringOn: aStream [
	aStream << interface name
]
