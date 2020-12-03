Class {
	#name : 'WabashPackageServiceClient',
	#superclass : 'WabashPackageService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashPackageServiceClient >> classNamed: aString [
	^ (remoteSelf classNamed: aString) wait
]

{ #category : 'accessing' }
WabashPackageServiceClient >> classNames [
	^ remoteSelf classNames wait
]

{ #category : 'RPackage accessing' }
WabashPackageServiceClient >> name [
	^ self packageName
]

{ #category : 'accessing' }
WabashPackageServiceClient >> packageName [
	^ remoteSelf packageName wait
]
