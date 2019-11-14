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
