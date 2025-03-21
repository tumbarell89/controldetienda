<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dsalidaalmacen
 *
 * @property $id
 * @property $factura
 * @property $total
 * @property $esventa
 * @property $nalmacenes_origen_id
 * @property $nalmacenes_destino_id
 * @property $dproveedor_destino_id
 * @property $estado
 * @property $created_at
 * @property $updated_at
 *
 * @property Dclienteproveedor $dclienteproveedor
 * @property Nalmacen $nalmacenorigen
 * @property Nalmacen $nalmacendestino
 * @property Dproductosalida[] $dproductosalidas
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dsalidaalmacen extends Model
{

    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['factura', 'precioventa', 'total', 'esventa','estado', 'nalmacenes_origen_id', 'nalmacenes_destino_id', 'dproveedor_destino_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function dclienteproveedor()
    {
        return $this->belongsTo(\App\Models\Dclienteproveedor::class, 'dproveedor_destino_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nalmacendestino()
    {
        return $this->belongsTo(\App\Models\Nalmacen::class, 'nalmacenes_destino_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nalmacenorigen()
    {
        return $this->belongsTo(\App\Models\Nalmacen::class, 'nalmacenes_origen_id', 'id');
    }

    // /**
    //  * @return \Illuminate\Database\Eloquent\Relations\HasMany
    //  */
    // public function dproductosalidas()
    // {
    //     return $this->hasMany(\App\Models\Dproductosalida::class, 'id', 'dsalidaalmacen_id');
    // }

    public function dproductosalidas()
    {
        return $this->belongsToMany(Dproducto::class, 'dproductosalidas')
                    ->withPivot('cantidad', 'precio')
                    ->withTimestamps();
    }

}
