"
I am the error raised when the type of a slot is violated.

My #expectedType inst. var. holds the expected type.
My #objectAttemptedToBeWritten inst. var. holds the object that one attempted to write.
"
Class {
	#name : #TypeViolation,
	#superclass : #Error,
	#instVars : [
		'expectedType',
		'objectAttemptedToBeWritten'
	],
	#category : #'TypedSlot-Errors'
}

{ #category : #'instance creation' }
TypeViolation class >> expectedType: aType objectAttemptedToBeWritten: object [
	^ self new
		expectedType: aType;
		objectAttemptedToBeWritten: object;
		yourself
]

{ #category : #accessing }
TypeViolation >> expectedType [
	^ expectedType
]

{ #category : #accessing }
TypeViolation >> expectedType: anObject [
	expectedType := anObject
]

{ #category : #accessing }
TypeViolation >> messageText [
	^ 'This slot expects an object of kind "{1}" while "{2}" has been provided.'
		format: { self expectedType printString . self objectAttemptedToBeWritten printString }
]

{ #category : #accessing }
TypeViolation >> objectAttemptedToBeWritten [
	^ objectAttemptedToBeWritten
]

{ #category : #accessing }
TypeViolation >> objectAttemptedToBeWritten: anObject [
	objectAttemptedToBeWritten := anObject
]
