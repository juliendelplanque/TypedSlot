Class {
	#name : #MockObjectForTypedSlotUsingInterface,
	#superclass : #Object,
	#instVars : [
		'#testSlot1 interface: ((Array new: 1) at: 1 put: (RemoteInterface source: FooableObject); yourself)',
		'#testSlot2 interface: #(#foo )'
	],
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingInterface class >> isTypeCheckingEnabled [
	^ true
]
