Class {
	#name : #MockObjectForTypedSlotUsingCollectionType,
	#superclass : #Object,
	#instVars : [
		'#orderedCollectionSlot type: (OrderedCollection of: Integer)',
		'#setCollectionSlot type: (Set of: String)'
	],
	#category : #'TypedSlot-Collection-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingCollectionType class >> isTypeCheckingEnabled [
	^ true
]
