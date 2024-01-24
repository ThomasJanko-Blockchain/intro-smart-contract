// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract SimpleCoinContract {
    // Étape 1: Variable d'état "minter"
    address public minter;
 
    // Étape 2: Variable d'état "balances"
    mapping(address => uint256) public balances;
 
    // Étape 5: Événement "Sent"
    event Sent(address indexed sender, address indexed recipient, uint256 amount);
 
    // Constructeur pour définir le créateur du contrat comme le minter initial
    constructor() {
        minter = msg.sender;
    }
 
    // Modifier pour s'assurer que la fonction n'est appelée que par le minter
    modifier onlyMinter() {
        require(msg.sender == minter, "Only the minter can call this function");
        _;
    }
 
    // Étape 3: Fonction pour augmenter le solde du compte (appelée par le minter)
    function increaseBalance(address account, uint256 amount) external onlyMinter {
        balances[account] += amount;
    }
 
    // Étape 4: Fonction d'envoi (peut être appelée par n'importe qui avec un solde suffisant)
    function sendCoins(address recipient, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
 
        // Soustraire le montant du solde de l'expéditeur
        balances[msg.sender] -= amount;
 
        // Ajouter le montant au solde du bénéficiaire
        balances[recipient] += amount;
 
        // Émettre l'événement "Sent"
        emit Sent(msg.sender, recipient, amount);
    }
}
 