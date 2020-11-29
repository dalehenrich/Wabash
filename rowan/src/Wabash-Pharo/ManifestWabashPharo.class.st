"
On server inspect result the following workspace:
	| host port acceptor connection server names semaphore |
	host := '127.0.0.1'.
	port := 47652.
	acceptor := RsrAcceptConnection
		host: host
		port: port.
	semaphore := Semaphore new.
	RsrProcessModel 
		fork: [ [connection := acceptor waitForConnection]
		ensure: [semaphore signal]].
	semaphore wait.
	connection

On client execute: 
	WbshLoginWindow login

A message dialog will pop up with the client _id. on the server inspect the following in the inspector for the first workspace:
	self serviceAt: <client _id>

On the server you have an inspector on the server-side service and an inspector on the client-side service ... you can send messages at will on either side ...

For my purposes, I will want to use client side doits to emulate the service side functionality ...
"
Class {
	#name : 'ManifestWabashPharo',
	#superclass : 'PackageManifest',
	#category : 'Wabash-Pharo-Manifest'
}
