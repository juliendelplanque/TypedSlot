"
An InterfaceTest is a test class for testing the behavior of Interface
"
Class {
	#name : #InterfaceTest,
	#superclass : #TestCase,
	#instVars : [
		'interfaceA',
		'interfaceB',
		'interfaceAB'
	],
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #running }
InterfaceTest >> setUp [
	super setUp.
	interfaceA := Interface selectors: #(a a:).
	interfaceB := Interface selectors: #(b).
	interfaceAB := Interface selectors: #(a b)
]

{ #category : #test }
InterfaceTest >> testExtendedInterfaces [
	interfaceA extendedInterfaces: { interfaceB }.
	
	self assertCollection: interfaceA selectors hasSameElements: #(a a: b).
	
	self should: [ interfaceA extendedInterfaces: { interfaceAB } ] raise: InterfacesConflict
]

{ #category : #test }
InterfaceTest >> testSelectors [
	self assertCollection: interfaceA selectors hasSameElements: #(a a:).
	self assertCollection: interfaceB selectors hasSameElements: #(b).
	self assertCollection: interfaceAB selectors hasSameElements: #(a b).
]
