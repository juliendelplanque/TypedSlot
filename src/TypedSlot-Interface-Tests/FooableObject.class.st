Class {
	#name : #FooableObject,
	#superclass : #Object,
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #accessing }
FooableObject class >> interface [
	^ Interface new
		addSelector: #foo;
		yourself
]

{ #category : #accessing }
FooableObject >> foo [
	^ 42
]
