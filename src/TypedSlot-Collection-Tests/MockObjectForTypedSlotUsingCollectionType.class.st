Class {
	#name : #MockObjectForTypedSlotUsingCollectionType,
	#superclass : #Object,
	#instVars : [
		'#orderedCollectionSlot type: OrderedCollection',
		'#setCollectionSlot type: Set'
	],
	#category : #'TypedSlot-Collection-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingCollectionType class >> isTypeCheckingEnabled [
	^ true
]
