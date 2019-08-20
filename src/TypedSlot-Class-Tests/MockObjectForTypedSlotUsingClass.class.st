"
Mock object for testing purpose.
"
Class {
	#name : #MockObjectForTypedSlotUsingClass,
	#superclass : #Object,
	#instVars : [
		'#testSlot type: Integer'
	],
	#category : #'TypedSlot-Class-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingClass class >> isTypeCheckingEnabled [
	^ true
]
