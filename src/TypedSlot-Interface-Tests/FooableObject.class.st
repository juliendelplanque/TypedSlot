Class {
	#name : #FooableObject,
	#superclass : #Object,
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #accessing }
FooableObject class >> interface [
	^ AnonymousInterfaceConstraint selectors: {#foo}
]

{ #category : #accessing }
FooableObject >> foo [
	^ 42
]
