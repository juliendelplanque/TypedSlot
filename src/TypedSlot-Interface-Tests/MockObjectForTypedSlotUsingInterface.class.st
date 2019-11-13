Class {
	#name : #MockObjectForTypedSlotUsingInterface,
	#superclass : #Object,
	#instVars : [
		'#namedInterfaceSlot understands: InterfacePlus',
		'#anonymousInterfaceSlot understands: #(#foo)'
	],
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #testing }
MockObjectForTypedSlotUsingInterface class >> isTypeCheckingEnabled [
	^ true

]
