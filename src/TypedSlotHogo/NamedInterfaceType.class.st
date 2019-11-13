Class {
	#name : #NamedInterfaceType,
	#superclass : #AbstractInterfaceType,
	#instVars : [
		'interfaceSource',
		'interfaceSelector'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
NamedInterfaceType >> definitionStringOn: aStream [
	aStream << interface name
]
