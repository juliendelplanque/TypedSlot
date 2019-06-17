Class {
	#name : #MockObjectForTypedSlotUsingCollectionType,
	#superclass : #Object,
	#instVars : [
		'#orderedCollectionSlot => ReadWriteTypedSlot type: (OrderedCollection withItemsType: Integer)',
		'#setCollectionSlot => ReadWriteTypedSlot type: (Set withItemsType: String)'
	],
	#category : #'TypedSlot-Collection-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingCollectionType class >> isTypeCheckingEnabled [
	^ true
]
