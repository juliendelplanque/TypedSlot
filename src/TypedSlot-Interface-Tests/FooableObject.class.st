Class {
	#name : #FooableObject,
	#superclass : #Object,
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #accessing }
FooableObject class >> interface [
	^ AnonymousInterfaceType selectors: {#foo}
]

{ #category : #accessing }
FooableObject >> foo [
	^ 42
]
