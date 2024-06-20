<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dentradaalmacen
 *
 * @property $id
 * @property $factura
 * @property $total
 * @property $estado
 * @property $nalmacens_id
 * @property $dproveedor_origen_id
 * @property $created_at
 * @property $updated_at
 *
 * @property Dclienteproveedor $dclienteproveedor
 * @property Nalmacen $nalmacen
 * @property Dproductoentrada[] $dproductoentradas
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dentradaalmacen extends Model
{

    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['factura', 'total', 'estado','nalmacens_id', 'dproveedor_origen_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function dclienteproveedor()
    {
        return $this->belongsTo(\App\Models\Dclienteproveedor::class, 'dproveedor_origen_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nalmacen()
    {
        return $this->belongsTo(\App\Models\Nalmacen::class, 'nalmacens_id', 'id');
    }

    // /**
    //  * @return \Illuminate\Database\Eloquent\Relations\HasMany
    //  */
    // public function dproductoentradas()
    // {
    //     return $this->hasMany(\App\Models\Dproductoentrada::class, 'id', 'dentradaalmacen_id');
    // }

    public function dproductoentradas()
    {
        return $this->belongsToMany(Dproducto::class, 'dproductoentradas')
                    ->withPivot('cantidad', 'precio')
                    ->withTimestamps();
    }

}
