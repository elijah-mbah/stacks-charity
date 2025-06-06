;; STACKSCHARITY - BITCOIN-NATIVE CHARITABLE PLATFORM
;;
;; Title: StacksCharity - Transparent Charitable Fund Management on Bitcoin
;;
;; Summary: A decentralized charity platform built on Stacks that brings 
;;          transparency, accountability, and trust to charitable giving through
;;          Bitcoin's security and immutability.
;;
;; Description: StacksCharity revolutionizes charitable giving by leveraging 
;;              Bitcoin's network effects and Stacks' smart contract capabilities.
;;              This platform enables transparent fund management, milestone-based
;;              disbursements, and real-time tracking of charitable impact. Every
;;              donation, utilization, and outcome is permanently recorded on the
;;              Bitcoin blockchain, ensuring unprecedented transparency and
;;              accountability in charitable operations.
;;
;; Features:
;; - Role-based access control (Admins, Moderators, Beneficiaries)
;; - Transparent beneficiary registration and verification
;; - Direct STX donations with automatic tracking
;; - Milestone-based fund utilization with approval workflows
;; - Immutable audit trail of all transactions
;; - Real-time impact reporting and analytics
;;
;; Built for the Bitcoin ecosystem, powered by Stacks Layer 2

;; Contract owner
(define-data-var contract-owner principal tx-sender)

;; Error constants
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; Role definitions
(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; Data structures
(define-map roles
  { user: principal }
  { role: uint }
)

(define-map beneficiaries
  { id: uint }
  {
    name: (string-utf8 50),
    description: (string-utf8 255),
    target-amount: uint,
    received-amount: uint,
    status: (string-ascii 20),
  }
)

(define-map donations
  { id: uint }
  {
    donor: principal,
    beneficiary-id: uint,
    amount: uint,
    timestamp: uint,
  }
)

(define-map utilization
  { id: uint }
  {
    beneficiary-id: uint,
    milestone: uint,
    description: (string-utf8 255),
    amount: uint,
    status: (string-ascii 20),
  }
)