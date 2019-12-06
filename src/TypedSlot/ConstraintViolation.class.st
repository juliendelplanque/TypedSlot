"
I am the error raised when the type of a slot is violated.

My #expectedType inst. var. holds the expected type.
My #objectAttemptedToBeWritten inst. var. holds the object that one attempted to write.
"
Class {
	#name : #ConstraintViolation,
	#superclass : #Error,
	#instVars : [
		'expectedType',
		'objectAttemptedToBeWritten'
	],
	#category : #'TypedSlot-Errors'
}

{ #category : #'instance creation' }
ConstraintViolation class >> expectedType: aType objectAttemptedToBeWritten: object [
	^ self new
		expectedType: aType;
		objectAttemptedToBeWritten: object;
		yourself
]

{ #category : #accessing }
ConstraintViolation >> expectedType [
	^ expectedType
]

{ #category : #accessing }
ConstraintViolation >> expectedType: anObject [
	expectedType := anObject
]

{ #category : #accessing }
ConstraintViolation >> messageText [
	^ 'This slot expects an object of kind "{1}" while "{2}" has been provided.'
		format: { self expectedType printString . self objectAttemptedToBeWritten printString }
]

{ #category : #accessing }
ConstraintViolation >> objectAttemptedToBeWritten [
	^ objectAttemptedToBeWritten
]

{ #category : #accessing }
ConstraintViolation >> objectAttemptedToBeWritten: anObject [
	objectAttemptedToBeWritten := anObject
]
