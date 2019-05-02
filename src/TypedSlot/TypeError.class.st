Class {
	#name : #TypeError,
	#superclass : #Error,
	#instVars : [
		'expectedType',
		'objectAttemptedToWrite'
	],
	#category : #'TypedSlot-Errors'
}

{ #category : #accessing }
TypeError >> expectedType [
	^ expectedType
]

{ #category : #accessing }
TypeError >> expectedType: anObject [
	expectedType := anObject
]

{ #category : #accessing }
TypeError >> objectAttemptedToWrite [
	^ objectAttemptedToWrite
]

{ #category : #accessing }
TypeError >> objectAttemptedToWrite: anObject [
	objectAttemptedToWrite := anObject
]
