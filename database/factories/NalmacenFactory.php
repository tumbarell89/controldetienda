<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Nalmacen>
 */
class NalmacenFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'denominacion'=>$this->faker->similar_text('alamcen', 'despacho'),
            'activo'=>fake()->randomElement([true, false]),
            //
        ];
    }
}
