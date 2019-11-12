"
Mock object for testing purpose.
"
Class {
	#name : #MockObjectForTypedSlotUsingBlockClosure,
	#superclass : #Object,
	#instVars : [
		'#testSlot satisfy: [ :x | x > 0 ]'
	],
	#category : #'TypedSlot-Block-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingBlockClosure class >> isTypeCheckingEnabled [
	^ true
]
