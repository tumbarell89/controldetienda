<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dclienteproveedor
 *
 * @property $id
 * @property $denominacion
 * @property $tipocliente
 * @property $esembarazada
 * @property $carnetidentidad
 * @property $activo
 * @property $created_at
 * @property $updated_at
 *
 * @property Dentradaalmacen[] $dentradaalmacens
 * @property Dsalidaalmacen[] $dsalidaalmacens
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dclienteproveedor extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['denominacion', 'tipocliente', 'esembarazada', 'carnetidentidad', 'activo'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dentradaalmacens()
    {
        return $this->hasMany(\App\Models\Dentradaalmacen::class, 'id', 'dproveedor_origen_id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dsalidaalmacens()
    {
        return $this->hasMany(\App\Models\Dsalidaalmacen::class, 'id', 'dproveedor_destino_id');
    }
    
}
