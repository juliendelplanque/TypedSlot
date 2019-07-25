Class {
	#name : #MockObjectForTypedSlotUsingCollectionType,
	#superclass : #Object,
	#instVars : [
		'#orderedCollectionSlot => TypedSlot type: (Array withItemsType: Integer)',
		'#setCollectionSlot => TypedSlot type: (OrderedCollection withItemsType: String)'
	],
	#category : #'TypedSlot-Collection-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingCollectionType class >> isTypeCheckingEnabled [
	^ true
]
