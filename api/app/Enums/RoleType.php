<?php

namespace App\Enums;

enum RoleType: string
{
    case EMPLOYE = "Employe";
    case CHEF_HERARCHIE = "Chef herarchique";
    case TECH_STOCK = "Technicien de stock";
    case TECH_DEVELEPPEMENT = "Technicien de développement";
    case TECH_RESEAU = "Technicien de réseaux";
    case TECH_MAINTENANCE = "Technicien de maintenance";
    case ADMIN = "Admin";
}
