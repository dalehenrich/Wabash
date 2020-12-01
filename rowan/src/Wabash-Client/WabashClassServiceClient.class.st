Class {
	#name : 'WabashClassServiceClient',
	#superclass : 'WabashClassService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashClassServiceClient >> classMethodNamed: aString [
	^ (remoteSelf classMethodNamed: aString) wait
]

{ #category : 'accessing' }
WabashClassServiceClient >> classMethodNames [
	^ (remoteSelf classMethodNames) wait
]

{ #category : 'accessing' }
WabashClassServiceClient >> instanceMethodNamed: aString [
	^ (remoteSelf instanceMethodNamed: aString) wait
]

{ #category : 'accessing' }
WabashClassServiceClient >> instanceMethodNames [
	^ (remoteSelf instanceMethodNames) wait
]
