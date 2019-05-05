Class {
	#name : #MockObjectForTypedSlotUsingInterface,
	#superclass : #Object,
	#instVars : [
		'#testSlot1 => TypedSlot type: (RemoteInterface source: FooableObject)',
		'#testSlot2 => TypedSlot type: (Interface selectors: #(#foo ))'
	],
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingInterface class >> isTypeCheckingEnabled [
	^ true
]
