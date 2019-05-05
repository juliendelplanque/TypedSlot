Class {
	#name : #MockObjectForTypedSlotUsingClass,
	#superclass : #Object,
	#instVars : [
		'#testSlot => TypedSlot type: Integer'
	],
	#category : #'TypedSlot-Class-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingClass class >> isTypeCheckingEnabled [
	^ true
]
