Class {
	#name : #MockObjectForTypedSlotUsingInterface,
	#superclass : #Object,
	#instVars : [
		'#testSlot1 type: (RemoteInterface source: FooableObject)',
		'#testSlot2 interface: #(#foo )'
	],
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingInterface class >> isTypeCheckingEnabled [
	^ true
]
