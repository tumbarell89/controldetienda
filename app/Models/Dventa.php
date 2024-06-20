<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dventa
 *
 * @property $id
 * @property $codigo
 * @property $total
 * @property $estado
 * @property $created_at
 * @property $updated_at
 *
 * @property Dventaproducto[] $dventaproductos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dventa extends Model
{

    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['codigoconcecutivo', 'total', 'estado'];


    // /**
    //  * @return \Illuminate\Database\Eloquent\Relations\HasMany
    //  */
    public function dventaproductos()
    {
        return $this->belongsToMany(Dproducto::class, 'dventaproductos')
                    ->withPivot('cantidad', 'precio')
                    ->withTimestamps();
    }
    // {
    //     return $this->hasMany(\App\Models\Dventaproducto::class, 'id', 'dventas_id');
    // }

}
