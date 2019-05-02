Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'selectors'
	],
	#category : #'TypedSlot-Core'
}

{ #category : #adding }
Interface >> addSelector: aSymbol [
	selectors add: aSymbol
]

{ #category : #initialization }
Interface >> initialize [
	super initialize.
	self selectors: Set new
]

{ #category : #accessing }
Interface >> selectors [
	^ selectors
]

{ #category : #accessing }
Interface >> selectors: anObject [
	selectors := anObject
]
