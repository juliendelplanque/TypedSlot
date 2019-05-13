Class {
	#name : #MockObjectForTypedSlotUsingCollectionType,
	#superclass : #Object,
	#instVars : [
		'#orderedCollectionSlot => TypedSlot type: (CollectionOfType withItemsType: Integer)',
		'#setCollectionSlot => TypedSlot type: (CollectionOfType withItemsType: String)'
	],
	#category : #'TypedSlot-Collection-Tests'
}
