"
Mock object for testing purpose.
"
Class {
	#name : #MockObjectForTypedSlotUsingTrait,
	#superclass : #Object,
	#instVars : [
		'#testSlot => TypedSlot type: MockTraitForTests'
	],
	#category : #'TypedSlot-Trait-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingTrait class >> isTypeCheckingEnabled [
	^ true
]