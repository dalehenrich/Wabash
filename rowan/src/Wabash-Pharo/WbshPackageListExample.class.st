Class {
	#name : 'WbshPackageListExample',
	#superclass : 'WbshAbstractProjectListExample',
	#category : 'Wabash-Pharo'
}

{ #category : 'accessing' }
WbshPackageListExample >> rootItems [

	^ listService packageNames asArray sort: [ :a :b | a < b ]
]

{ #category : 'accessing' }
WbshPackageListExample >> title [

	^'Package list (client _id: ' , listService _id printString,  ')'
]
