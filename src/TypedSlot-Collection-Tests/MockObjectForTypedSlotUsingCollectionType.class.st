Class {
	#name : #MockObjectForTypedSlotUsingCollectionType,
	#superclass : #Object,
	#instVars : [
		'#orderedCollectionSlot type: (OrderedCollection withItemsType: Integer)',
		'#setCollectionSlot type: (Set withItemsType: String)'
	],
	#category : #'TypedSlot-Collection-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingCollectionType class >> isTypeCheckingEnabled [
	^ true
]
